extends: default.liquid

title: Docker Quick Tips
---

<table>
	<thead>
		<tr><th>Command</th><th>Description</th></tr>
	</thead>
	<tbody>
		<tr>
			<td>docker rm $(docker ps -q -f status=exited)</td>
			<td>Remove all exited containers</td>
		</tr>
		<tr>
			<td>docker rmi $(docker images --filter dangling=true -q)</td>
			<td>Remove all unused images</td>
		</tr>
	</tbody>
</table>
