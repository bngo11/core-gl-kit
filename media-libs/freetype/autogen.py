#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://gitlab.freedesktop.org/api/v4/projects/7950/repository/tags", is_json=True)
	version = None

	for item in json_data:
		try:
			version = item["name"].replace('VER-','')
			verlist = version.split("-")
			list(map(int, verlist))
			version = ".".join(verlist)
			break

		except (KeyError, IndexError, ValueError):
			continue

	if version:
		url = f'https://download.savannah.gnu.org/releases/freetype/freetype-{version}.tar.xz'
		utils_url = f'https://download.savannah.gnu.org/releases/freetype/ft2demos-{version}.tar.xz'
		doc_url = f'https://download.savannah.gnu.org/releases/freetype/freetype-doc-{version}.tar.xz'
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=url.rsplit('/', 1)[-1]),
						hub.pkgtools.ebuild.Artifact(url=utils_url, final_name=utils_url.rsplit('/', 1)[-1]),
						hub.pkgtools.ebuild.Artifact(url=doc_url, final_name=doc_url.rsplit('/', 1)[-1]),
			]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
