#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	# get version
	json_data = await hub.pkgtools.fetch.get_page(f"https://api.github.com/repos/KhronosGroup/Vulkan-Headers/tags", is_json=True)

	for item in json_data:
		try:
			name = item["name"]
			if not name.startswith("vulkan-sdk-"):
				continue
			version = name.rsplit("-", 1)[-1]
			list(map(int, version.split(".")))
			break

		except (KeyError, IndexError, ValueError):
			continue

	if version:
		url = f"https://github.com/zeux/volk/archive/vulkan-sdk-{version}.tar.gz"
		fn = f"volk-{version}.tar.gz"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=fn)]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
