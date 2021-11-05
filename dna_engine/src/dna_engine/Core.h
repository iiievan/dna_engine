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

#ifdef DNAE_ENABLE_ASSERTS
#define DNAE_ASSERT(x, ...) { if(!(x)) { DNAE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#define DNAE_CORE_ASSERT(x, ...) { if(!(x)) { LOG_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
#define DNAE_ASSERT(x, ...)
#define DNAE_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

