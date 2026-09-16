package io.github.brainboxemb.templatejava;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class AppTest {
    @Test
    public void exposesExpectedReferenceConsumerMessage() {
        // Migration 006 canary: Java-only changes must select Windows smoke, not full Maven verification.
        assertEquals("template.java-project OK", App.message());
    }
}
