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
    kind "SharedLib"
    language "C++"
    staticruntime "off"


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
        cppdialect "C++17"
        systemversion "latest"

    defines 
    { 
        "DNAE_PLATFORM_WINDOWS",
        "DNAE_BUILD_DLL",
        "GLFW_INCLUDE_NONE"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        runtime "Release"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

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
        cppdialect "C++17"
        systemversion "latest"

    defines 
    { 
        "DNAE_PLATFORM_WINDOWS"
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        runtime "Release"
        optimize "On"