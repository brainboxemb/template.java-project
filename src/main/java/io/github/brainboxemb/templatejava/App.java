package io.github.brainboxemb.templatejava;

/**
 * Deliberately tiny runnable application used to prove the released Java project tooling
 * from a repository outside {@code tool.java-project}.
 */
public final class App {
    private App() {
    }

    public static String message() {
        return "template.java-project OK";
    }

    public static void main(String[] args) {
        System.out.println(message());
    }
}
