#include<dna_engine.h>

class Sandbox : public dna_engine::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

dna_engine::Application* dna_engine::CreateApplication()
{
	return new Sandbox();
}