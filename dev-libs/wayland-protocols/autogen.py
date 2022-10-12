#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://gitlab.freedesktop.org/api/v4/projects/2891/repository/tags", is_json=True)
	version = None

	for item in json_data:
		try:
			version = item['name']
			break

		except (IndexError, AttributeError, KeyError):
			continue

	if version:
		final_name = f"wayland-protocols-{version}.tar.xz"
		url = f"https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/{version}/downloads/wayland-protocols-{version}.tar.xz"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
