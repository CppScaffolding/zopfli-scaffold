-- scaffold geniefile for zopfli

zopfli_script = path.getabsolute(path.getdirectory(_SCRIPT))
zopfli_root = path.join(zopfli_script, "zopfli")

zopfli_includedirs = {
	path.join(zopfli_script, "config"),
	zopfli_root,
}

zopfli_libdirs = {}
zopfli_links = {}
zopfli_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { zopfli_includedirs }
	end,

	_add_defines = function()
		defines { zopfli_defines }
	end,

	_add_libdirs = function()
		libdirs { zopfli_libdirs }
	end,

	_add_external_links = function()
		links { zopfli_links }
	end,

	_add_self_links = function()
		links { "zopfli" }
	end,

	_create_projects = function()

project "zopfli"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		zopfli_includedirs,
	}

	defines {}

	files {
		path.join(zopfli_script, "config", "**.h"),
		path.join(zopfli_root, "**.h"),
		path.join(zopfli_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
