workspace "dna_engine"
    architecture "x64"
    configurations 
    { 
        "Debug", 
        "Release",
        "Dist" 
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder(solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "dna_engine/vendor/GLFW/include"
IncludeDir["Glad"] = "dna_engine/vendor/Glad/include"
IncludeDir["ImGui"] = "dna_engine/vendor/imgui"

include "dna_engine/vendor/GLFW"
include "dna_engine/vendor/Glad"
include "dna_engine/vendor/imgui"

project "dna_engine"
    location "dna_engine"
    kind "SharedLib"
    language "C++"


    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/" ..outputdir.. "/%{prj.name}")

    pchheader "dnae_pch.h"
    pchsource "dna_engine/src/dnae_pch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}"
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
        staticruntime "On"
        systemversion "latest"
    defines 
    { 
        "DNAE_PLATFORM_WINDOWS",
        "DNAE_BUILD_DLL",
        "GLFW_INCLUDE_NONE"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        buildoptions "/MD"
        optimize "On"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        buildoptions "/MD"
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
        "dna_engine/src", 
        "dna_engine/vendor/spdlog/include"       
    }

    links
    {
        "dna_engine"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
    defines 
    { 
        "DNAE_PLATFORM_WINDOWS"
    }
    
    filter "configurations:Debug"
        defines "DNAE_DEBUG"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        defines "DNAE_RELEASE"
        buildoptions "/MD"
        optimize "On"

    filter "configurations:Dist"
        defines "DNAE_DIST"
        buildoptions "/MD"
        optimize "On"