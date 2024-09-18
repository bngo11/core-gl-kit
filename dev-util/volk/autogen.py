#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	'''
	json_data = await hub.pkgtools.fetch.get_page("https://api.github.com/repos/mesonbuild/meson/releases", is_json=True)
	version = None
	url = None

	for item in json_data:
		try:
			if item["prerelease"] or item["draft"]:
				continue

			version = item["tag_name"]
			list(map(int, version.split(".")))

			for asset in item['assets']:
				asset_name = asset["name"]

				if asset_name.endswith("tar.gz"):
					url = asset["browser_download_url"]
					break

			if url:
				break

		except (KeyError, IndexError, ValueError):
			continue

	if version and url:
	'''
	version = "1.3.290"
	url = f"https://github.com/zeux/volk/archive/vulkan-sdk-{version}.tar.gz"
	fn = f"volk-{version}.tar.gz"
	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=fn)]
	)
	ebuild.push()

# vim: ts=4 sw=4 noet
