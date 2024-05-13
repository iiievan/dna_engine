#include "dnae_pch.h"
#include "Platform/OpenGL/OpenGLContext.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>

namespace dna_engine
{
	OpenGLContext::OpenGLContext(GLFWwindow* windowHandle)
		:m_WindowHandle(windowHandle)
	{
		DNAE_CORE_ASSERT(windowHandle, "Window handle is Null!");
	}

	void OpenGLContext::Init()
	{
		glfwMakeContextCurrent(m_WindowHandle);
		int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);

		DNAE_CORE_ASSERT(status, "Failed to initialize Glad!");
	}

	void OpenGLContext::SwapBuffers()
	{
		glBegin(GL_TRIANGLES);

		glEnd();

		glfwSwapBuffers(m_WindowHandle);
	}
}