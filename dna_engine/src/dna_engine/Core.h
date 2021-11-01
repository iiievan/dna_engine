#pragma once

#ifdef DNAE_PLATFORM_WINDOWS
	#ifdef DNAE_BUILD_DLL
		#define DNAE_API __declspec(dllexport)
	#else
		#define DNAE_API __declspec(dllimport)
	#endif // DNAE_BUILD_DLL
#else
	#error dna engine only supports windows!
#endif // DNAE_PLATFORM_WINDOWS

