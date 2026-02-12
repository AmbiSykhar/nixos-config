#!/run/current-system/sw/bin/node

import { execSync } from 'child_process';

let lastWindows = null;

while (true) {
let windows = execSync("/run/current-system/sw/bin/niri msg -j windows");

if (windows == lastWindows)
	continue;

lastWindows = windows;
windows = JSON.parse(windows);

let workspaces = JSON.parse(execSync("/run/current-system/sw/bin/niri msg -j workspaces"));

let currentWorkspace = null;
for (let ws of workspaces) {
	if (!ws.is_focused) {
		continue;
	}

	currentWorkspace = ws;
	break;
}

let focused = -1;
let inWorkspace = [];
for (let window of windows) {
	if (window.workspace_id == currentWorkspace.id) {
		let w = window.id;
		let pos = window.layout.pos_in_scrolling_layout[0] - 1;
		inWorkspace[pos] ??= [];
		inWorkspace[pos].push(w);

		if (window.is_focused) {
			focused = pos;
		}
	}
}

let str = "";
for (let i = 0; i < inWorkspace.length; i++) {
	str += focused == i ? "󰋘" : "󰋙"
}

let output = {
	text: str,
};

console.log(JSON.stringify(output));
}
