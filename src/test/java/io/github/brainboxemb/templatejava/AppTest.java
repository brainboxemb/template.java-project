package io.github.brainboxemb.templatejava;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class AppTest {
    @Test
    public void exposesExpectedReferenceConsumerMessage() {
        assertEquals("template.java-project OK", App.message());
    }
}
