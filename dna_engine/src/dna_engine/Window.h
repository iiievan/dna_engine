#pragma once

#include "dnae_pch.h"

#include "dna_engine/Core.h"
#include "dna_engine/Events/Event.h"

namespace dna_engine 
{
	struct WindowProps
	{
		std::string Title;
		unsigned int Width;
		unsigned int Height;

		WindowProps(const std::string& title = "DNAEngine",
						  unsigned int width = 1280,
					      unsigned int height = 720)
			: Title(title), Width(width), Height(height)
		{
		}
	};

	// Interface representing a desktop system based Window
	class DNAE_API Window
	{
	public:
		//[EM001.s1]:Make functor(EventCallbackFn) for �reate a separate thread for callback function.
		typedef std::function<void (Event&)> EventCallbackFn;
		//using EventCallbackFn = std::function<void(Event&)>; //these is equivalent.

		virtual ~Window() {}

		virtual void OnUpdate() = 0;

		virtual unsigned int GetWidth() const = 0;
		virtual unsigned int GetHeight() const = 0;

		// Window attributes
		virtual void SetEventCallback(const EventCallbackFn& callback) = 0;
		virtual void SetVSync(bool enabled) = 0;
		virtual bool IsVSync() const = 0;

		virtual void* GetNativeWindow() const = 0;

		static Window* Create(const WindowProps& props = WindowProps());
	};

}
