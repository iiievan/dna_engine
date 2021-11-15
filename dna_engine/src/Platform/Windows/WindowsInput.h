#pragma once

#include "dna_engine/Input.h"

namespace dna_engine
{
	class WindowsInput : public Input
	{
	protected:
		virtual bool IsKeyPressedImpl(int keycode) override;

		virtual bool IsMouseButtonPressedImpl(int button);
		virtual float GetMouseXImpl();
		virtual float GetMouseYImpl();

		virtual std::pair<float, float> GetMousePositionImpl();
	};
}