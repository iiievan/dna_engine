#pragma once

#ifdef DNAE_PLATFORM_WINDOWS

extern dna_engine::Application* dna_engine::CreateApplication();

int main(int argc, char** argv)
{
	int a = 5;

	dna_engine::Log::Init();
	LOG_CORE_INFO("Initialized Log!");
	LOG_CORE_WARN("Hello DNA! VAR = {0}", a);

	auto app = dna_engine::CreateApplication();

	app->Run();

	delete app;
}

#endif // DNAE_PLATFORM_WINDOWS

