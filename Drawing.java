package eu.pl.sii

public class Drawing {

    class Square {
        int x;
    }

    class Rectangle {
        int x;
        int y;
    }

    class Triangle {
        int x;
        int h;
    }

    public double calculateArea(Object o) {
        if (o instanceof Square) {
            return ((Square) o).x * ((Square) o).x;
        } else if (o instanceof Rectangle) {
            return ((Rectangle) o).x * ((Rectangle) o).y;
        } else if (o instanceof Triangle) {
            return 0.5 * ((Triangle) o).x * ((Triangle) o).h;
        } else {
            throw new UnsupportedOperationException();
        }
    }

}
