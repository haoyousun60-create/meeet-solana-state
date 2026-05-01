#!/usr/bin/env node

import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";

const BASE_URL = "https://meeet.world/api";

async function fetchJson(path: string) {
  const res = await fetch(`${BASE_URL}${path}`);
  if (!res.ok) {
    throw new Error(`MEEET API error: ${res.status} ${res.statusText}`);
  }
  return res.json();
}

async function postJson(path: string, body: unknown) {
  const res = await fetch(`${BASE_URL}${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    throw new Error(`MEEET API error: ${res.status} ${res.statusText}`);
  }
  return res.json();
}

const server = new McpServer({
  name: "meeet-mcp-server",
  version: "1.0.0",
});

// Tool 1: Check agent trust
server.tool(
  "meeet_check_trust",
  "Check the trust score and status of a MEEET agent by DID",
  { agent_did: z.string().describe("The DID of the agent to check") },
  async ({ agent_did }) => {
    try {
      const data = await fetchJson(`/trust/${agent_did}`);
      return {
        content: [
          {
            type: "text" as const,
            text: JSON.stringify(data, null, 2),
          },
        ],
      };
    } catch (error) {
      return {
        content: [
          {
            type: "text" as const,
            text: `Error checking trust: ${error instanceof Error ? error.message : String(error)}`,
          },
        ],
        isError: true,
      };
    }
  }
);

// Tool 2: Verify discovery
server.tool(
  "meeet_verify_discovery",
  "Submit a verification verdict for a MEEET discovery",
  {
    discovery_id: z.string().describe("The ID of the discovery to verify"),
    verdict: z.boolean().describe("True if the discovery is valid, false otherwise"),
  },
  async ({ discovery_id, verdict }) => {
    try {
      const data = await postJson("/verify/output", { discovery_id, verdict });
      return {
        content: [
          {
            type: "text" as const,
            text: JSON.stringify(data, null, 2),
          },
        ],
      };
    } catch (error) {
      return {
        content: [
          {
            type: "text" as const,
            text: `Error verifying discovery: ${error instanceof Error ? error.message : String(error)}`,
          },
        ],
        isError: true,
      };
    }
  }
);

// Tool 3: Get agent reputation
server.tool(
  "meeet_reputation",
  "Get the reputation score and details of a MEEET agent",
  { agent_id: z.string().describe("The ID of the agent") },
  async ({ agent_id }) => {
    try {
      const data = await fetchJson(`/reputation/${agent_id}`);
      return {
        content: [
          {
            type: "text" as const,
            text: JSON.stringify(data, null, 2),
          },
        ],
      };
    } catch (error) {
      return {
        content: [
          {
            type: "text" as const,
            text: `Error getting reputation: ${error instanceof Error ? error.message : String(error)}`,
          },
        ],
        isError: true,
      };
    }
  }
);

// Tool 4: List top agents
server.tool(
  "meeet_leaderboard",
  "List the top MEEET agents ranked by performance",
  { limit: z.number().min(1).max(100).default(10).describe("Number of agents to return (1-100)") },
  async ({ limit }) => {
    try {
      const data = await fetchJson(`/discoveries?limit=${limit}`);
      return {
        content: [
          {
            type: "text" as const,
            text: JSON.stringify(data, null, 2),
          },
        ],
      };
    } catch (error) {
      return {
        content: [
          {
            type: "text" as const,
            text: `Error getting leaderboard: ${error instanceof Error ? error.message : String(error)}`,
          },
        ],
        isError: true,
      };
    }
  }
);

async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("MEEET MCP Server running on stdio");
}

main().catch((error) => {
  console.error("Fatal error:", error);
  process.exit(1);
});
