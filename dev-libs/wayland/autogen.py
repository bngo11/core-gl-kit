#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://gitlab.freedesktop.org/api/v4/projects/121/repository/tags", is_json=True)
	version = None

	for item in json_data:
		try:
			version = item['name']
			ver = version.split(".")
			list(map(int, ver))
			if int(ver[-1]) < 90:
				break

		except (IndexError, ValueError, KeyError):
			continue
	else:
		version = None

	if version:
		final_name = f"wayland-{version}.tar.xz"
		url = f"https://wayland.freedesktop.org/releases/wayland-{version}.tar.xz"
		wayland = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			template="wayland.tmpl",
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		wayland.push()

		scanner = hub.pkgtools.ebuild.BreezyBuild(
			cat="dev-util",
			name="wayland-scanner",
			template="wayland-scanner.tmpl",
			template_path=wayland.template_path,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		scanner.push()
# vim: ts=4 sw=4 noet
