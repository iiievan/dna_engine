#include "dnae_pch.h"

#include "Application.h"

#include "dna_engine/Log.h"

#include <GLFW/glfw3.h>

namespace dna_engine
{
#define BIND_EVENT_FN(x) std::bind(&Application::x, this, std::placeholders::_1)

	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());

		//[EM001.s2] in application after window creation
		m_Window->SetEventCallback(BIND_EVENT_FN(OnEvent));
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (m_Running)
		{
			glClearColor(1, 0, 1, 1);
			glClear(GL_COLOR_BUFFER_BIT);
			m_Window->OnUpdate();
		}
	}

	// [EM001.s5]: Callback after the function glfwSetWindowCloseCallback is executed
	void Application::OnEvent(Event& e)
	{
		EventDispatcher dispatcher(e);
		dispatcher.Dispatch<WindowCloseEvent>(BIND_EVENT_FN(OnWindowClose));

		LOG_CORE_TRACE("{0}", e);
	}

	// [EM001.s6]: Callback after dispatcher dispatch WindowCloseEvent
	bool Application::OnWindowClose(WindowCloseEvent& e)
	{
		m_Running = false;

		return true;
	}
}
