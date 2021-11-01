#pragma once

#ifdef DNAE_PLATFORM_WINDOWS

extern dna_engine::Application* dna_engine::CreateApplication();

int main(int argc, char** argv)
{
	printf("DNA engine started.");

	auto app = dna_engine::CreateApplication();

	app->Run();

	delete app;
}

#endif // DNAE_PLATFORM_WINDOWS

