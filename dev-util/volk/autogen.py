#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	version = "1.4.328"
	url = f"https://github.com/zeux/volk/archive/vulkan-sdk-{version}.tar.gz"
	fn = f"volk-{version}.tar.gz"
	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=fn)]
	)
	ebuild.push()

# vim: ts=4 sw=4 noet
