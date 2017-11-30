#include <iostream>
#include <SFML/Graphics.hpp>

int main()
{
    std::cout << "Start application";

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

    return 0;
}
