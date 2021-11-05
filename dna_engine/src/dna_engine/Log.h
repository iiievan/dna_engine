#pragma once

#include <memory>
#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/fmt/ostr.h"

namespace dna_engine 
{
	class DNAE_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger()   { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// for core
#define	LOG_CORE_TRACE(...)		::dna_engine::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define	LOG_CORE_INFO(...)		::dna_engine::Log::GetCoreLogger()->info(__VA_ARGS__)
#define	LOG_CORE_WARN(...)		::dna_engine::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define	LOG_CORE_ERROR(...)		::dna_engine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define	LOG_CORE_FATAL(...)		::dna_engine::Log::GetCoreLogger()->critical(__VA_ARGS__)

// for client
#define	DNAE_TRACE(...)		::dna_engine::Log::GetClientLogger()->trace(__VA_ARGS__)
#define	DNAE_INFO(...)		::dna_engine::Log::GetClientLogger()->info(__VA_ARGS__)
#define	DNAE_WARN(...)		::dna_engine::Log::GetClientLogger()->warn(__VA_ARGS__)
#define	DNAE_ERROR(...)		::dna_engine::Log::GetClientLogger()->error(__VA_ARGS__)
#define	DNAE_FATAL(...)		::dna_engine::Log::GetClientLogger()->critical(__VA_ARGS__)

