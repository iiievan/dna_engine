#include "Application.h"

#include "dna_engine/Events/ApplicationEvent.h"
#include "dna_engine/Log.h"

namespace dna_engine
{
	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		DNAE_TRACE(e.ToString());

		while (true)
		{

		}
	}
}
