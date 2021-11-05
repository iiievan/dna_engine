#include "dnae_pch.h"

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
		if(e.IsInCategory(EventCategoryApplication))
			DNAE_TRACE(e);
		if (e.IsInCategory(EventCategoryKeyboard))
			DNAE_TRACE(e);

		while (true)
		{

		}
	}
}
