extends: default.liquid

title: Rust Quick Tips
---

<table>
	<thead>
		<tr><th>command</th><th>description</th></tr>
	</thead>
	<tbody>
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
			<td>cargo fmt </td>
			<td>Format sourcecode in project</td>
		</tr>
	</tbody>
</table>
