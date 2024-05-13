workspace "dna_engine"
    architecture "x64"
    startproject "Sandbox"

    configurations 
    { 
        "Debug", 
        "Release",
        "Dist" 
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder(solution directory)
IncludeDir = {}
IncludeDir["GLFW"]  = "dna_engine/vendor/GLFW/include"
IncludeDir["Glad"]  = "dna_engine/vendor/Glad/include"
IncludeDir["ImGui"] = "dna_engine/vendor/imgui"
IncludeDir["glm"]   = "dna_engine/vendor/glm"

include "dna_engine/vendor/GLFW"
include "dna_engine/vendor/Glad"
include "dna_engine/vendor/imgui"

project "dna_engine"
    location "dna_engine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"


    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/" ..outputdir.. "/%{prj.name}")

    pchheader "dnae_pch.h"
    pchsource "dna_engine/src/dnae_pch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/vendor/glm/glm/**.hpp",
        "%{prj.name}/vendor/glm/glm/**.inl",

    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    filter "system:windows"
        systemversion "latest"

    defines 
    { 
        "DNAE_PLATFORM_WINDOWS",
        "DNAE_BUILD_STATIC",
        "GLFW_INCLUDE_NONE"
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        runtime "Release"
        optimize "on"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/" ..outputdir.. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "dna_engine/src", 
        "dna_engine/vendor/spdlog/include",
        "dna_engine/vendor", 
        "%{IncludeDir.glm}"         
    }

    links
    {
        "dna_engine"
    }

    filter "system:windows"
        systemversion "latest"

    defines 
    { 
        "DNAE_PLATFORM_WINDOWS",
        "DNAE_BUILD_STATIC"
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        runtime "Release"
        optimize "on"