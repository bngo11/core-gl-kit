#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://api.github.com/repos/anholt/libepoxy/releases")
	json_list = json.loads(json_data)
	version = None
	url = None

	for item in json_list:
		if not item['prerelease']:
			try:
				version = item['tag_name']
				url = item['assets'][0]['browser_download_url']
				break

			except (IndexError, AttributeError):
				continue

	if version and url:
		final_name = f"libeproxy-{version}.tar.xz"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()

# vim: ts=4 sw=4 noet
