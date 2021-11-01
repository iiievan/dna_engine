#pragma once

#include "Core.h"

namespace dna_engine
{
	class DNAE_API Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}

