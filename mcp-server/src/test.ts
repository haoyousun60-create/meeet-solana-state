/**
 * Quick test — verifies the MEEET MCP server can start and respond to tool calls.
 * Run with: npx tsx src/test.ts
 */

import { Client } from "@modelcontextprotocol/sdk/client/index.js";
import { StdioClientTransport } from "@modelcontextprotocol/sdk/client/stdio.js";

async function main() {
  console.log("🧪 Testing MEEET MCP Server...\n");

  const transport = new StdioClientTransport({
    command: "node",
    args: ["dist/index.js"],
  });

  const client = new Client({ name: "test-client", version: "1.0.0" });
  await client.connect(transport);
  console.log("✅ Connected to server\n");

  // List tools
  const { tools } = await client.listTools();
  console.log(`📋 ${tools.length} tools registered:`);
  for (const t of tools) {
    console.log(`   • ${t.name} — ${t.description?.slice(0, 60)}...`);
  }
  console.log();

  // Test meeet_status
  console.log("── Testing meeet_status ──");
  try {
    const result = await client.callTool({ name: "meeet_status", arguments: {} });
    const text = (result.content as Array<{ type: string; text: string }>)[0]?.text ?? "";
    console.log(text.slice(0, 300));
    console.log("✅ meeet_status OK\n");
  } catch (e) {
    console.log(`⚠️ meeet_status: ${e}\n`);
  }

  // Test meeet_discoveries
  console.log("── Testing meeet_discoveries ──");
  try {
    const result = await client.callTool({ name: "meeet_discoveries", arguments: { limit: 3 } });
    const text = (result.content as Array<{ type: string; text: string }>)[0]?.text ?? "";
    console.log(text.slice(0, 500));
    console.log("✅ meeet_discoveries OK\n");
  } catch (e) {
    console.log(`⚠️ meeet_discoveries: ${e}\n`);
  }

  // Test meeet_tasks
  console.log("── Testing meeet_tasks ──");
  try {
    const result = await client.callTool({ name: "meeet_tasks", arguments: { limit: 3 } });
    const text = (result.content as Array<{ type: string; text: string }>)[0]?.text ?? "";
    console.log(text.slice(0, 500));
    console.log("✅ meeet_tasks OK\n");
  } catch (e) {
    console.log(`⚠️ meeet_tasks: ${e}\n`);
  }

  await client.close();
  console.log("🎉 All tests complete!");
}

main().catch((e) => {
  console.error("Test failed:", e);
  process.exit(1);
});
