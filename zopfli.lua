-- package geniefile for zopfli

zopfli_script = path.getabsolute(path.getdirectory(_SCRIPT))
zopfli_root = path.join(zopfli_script, "zopfli")

zopfli_includedirs = {
	zopfli_root,
	path.join(zopfli_root, "src"),
}

zopfli_defines = {
}

zopfli_libdirs = {}
zopfli_links = {}

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

	--- original zopfli geniefile file creates several projects, we're wrapping it all in one

	project "zopfli"
		kind "StaticLib"
		language "C"

		includedirs {
			zopfli_includedirs,
		}

		defines {
			--"zopfli_USE_CXX03_STDLIB",
		}

		files {
			path.join(zopfli_root, "src/zopfli/**.h"),
			path.join(zopfli_root, "src/zopfli/**.c"),
		}

		excludes {
			path.join(zopfli_root, "src/zopfli/zopfli_bin.c"),
		}

		buildoptions {
		}

		linkoptions {
		}

	---

	project "zopfli_png"
		kind "StaticLib"
		language "C++"

		includedirs {
			zopfli_includedirs,
		}

		defines {
			--"zopfli_USE_CXX03_STDLIB",
		}

		files {
			path.join(zopfli_root, "src/zopflipng/*_lib.h"),
			path.join(zopfli_root, "src/zopflipng/*_lib.cc"),
		}

		buildoptions {
			cpp14_buildoptions,
		}

		linkoptions {
			cpp14_linkoptions,
		}

	---

	project "zopfli_lodepng"
		kind "StaticLib"
		language "C++"

		includedirs {
			zopfli_includedirs,
		}

		defines {
			--"zopfli_USE_CXX03_STDLIB",
		}

		files {
			path.join(zopfli_root, "src/zopflipng/lodepng/*.h"),
			path.join(zopfli_root, "src/zopflipng/lodepng/*.cpp"),
			path.join(zopfli_root, "src/zopflipng/lodepng/*.cc"),
		}

		buildoptions {
			cpp14_buildoptions,
		}

		linkoptions {
			cpp14_linkoptions,
		}

	---

	project "zopflic"
		kind "ConsoleApp"
		language "C"

		includedirs {
			zopfli_includedirs,
		}

		defines {
			--"zopfli_USE_CXX03_STDLIB",
		}

		files {
			path.join(zopfli_root, "src/zopfli/zopfli_bin.c"),
		}

		links {
			"zopfli",
		}

		buildoptions {
		}

		linkoptions {
		}

	---

	project "zopfli_pngenc"
		kind "ConsoleApp"
		language "C++"

		includedirs {
			zopfli_includedirs,
		}

		defines {
			--"zopfli_USE_CXX03_STDLIB",
		}

		files {
			path.join(zopfli_root, "src/zopflipng/*_bin.cc"),
		}

		links {
			"zopfli",
			"zopfli_png",
			"zopfli_lodepng",
		}

		buildoptions {
			cpp14_buildoptions,
		}

		linkoptions {
			cpp14_linkoptions,
		}

	---
	end, -- _create_projects()
}

---
