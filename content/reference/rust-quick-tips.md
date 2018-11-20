---
title: Rust Quick Tips
layout: default.liquid
data:
  shortlink: 420cbe5a
---
<table>
	<thead>
		<tr><th>command</th><th>description</th></tr>
	</thead>
	<tbody>
		<tr>
			<td>cargo run -- --arg --arg1 test</td>
			<td>Run executable with commandline arguments</td>
		</tr>
		<tr>
			<td>cargo test -- --nocapture</td>
			<td>Display stdout during testrun (can be helpful for debugging)</td>
		</tr>
		<tr>
			<td>cargo doc --no-deps</td>
			<td>Create documentation without dependencies </td>
		</tr>
		<tr>
			<td>cargo doc --open</td>
			<td>Create local full documentation and open it in browser</td>
		</tr>
		<tr>
			<td>cargo install rustfmt</td>
			<td>Install rust formatter</td>
		</tr>
		<tr>
			<td>cargo fmt</td>
			<td>Format sourcecode in project</td>
		</tr>
		<tr>
			<td>cargo install --list</td>
			<td>list all installed crates</td>
		</tr>
	</tbody>
</table>
