#include "dnae_pch.h"

#include "Application.h"

#include "dna_engine/Events/ApplicationEvent.h"
#include "dna_engine/Log.h"

#include <GLFW/glfw3.h>

namespace dna_engine
{
	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (m_Running)
		{
			m_Window->OnUpdate();
		}
	}
}
