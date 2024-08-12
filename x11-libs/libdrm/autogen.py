#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://gitlab.freedesktop.org/api/v4/projects/177/repository/tags", is_json=True)
	version = None

	for item in json_data:
		try:
			name = item['name']
			version = name.split('-')[-1]
			ver = version.split(".")
			list(map(int, ver))
			if int(ver[1]) % 2 == 0:
				break

		except (IndexError, ValueError, KeyError):
			continue
	else:
		version = None

	if version:
		final_name = f"{name}.tar.xz"
		url = f"https://dri.freedesktop.org/libdrm/{final_name}"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()
# vim: ts=4 sw=4 noet
