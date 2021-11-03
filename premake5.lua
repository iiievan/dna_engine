workspace "dna_engine"
    architecture "x64"
    configurations 
    { 
        "Debug", 
        "Release",
        "Dist" 
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "dna_engine"
    location "dna_engine"
    kind "SharedLib"
    language "C++"


    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/" ..outputdir.. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "dna_engine/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "10.0.19041.0"
    defines 
    { 
        "DNAE_PLATFORM_WINDOWS",
        "DNAE_BUILD_DLL"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/" ..outputdir.. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "dna_engine/vendor/spdlog/include",
        "dna_engine/src"
    }

    links
    {
        "dna_engine"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "10.0.19041.0"
    defines 
    { 
        "DNAE_PLATFORM_WINDOWS"
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        optimize "On"