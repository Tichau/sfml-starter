#include "Application.hpp"

using namespace std;

namespace Game
{
    int Application::Run()
    {
        cout << "Start application";
        sf::RenderWindow window(sf::VideoMode(800, 600), "Game", sf::Style::Titlebar | sf::Style::Close);

        sf::CircleShape shape(100.f);
        shape.setFillColor(sf::Color::Green);

        while (window.isOpen())
        {
            sf::Event event;
            while (window.pollEvent(event))
            {
                if (event.type == sf::Event::Closed)
                    window.close();
            }

            window.clear();
            window.draw(shape);
            window.display();
        }
        
        std::cout << "Release application";

        return 0;
    }
}
