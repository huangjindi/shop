package demo;

import org.junit.*;

public class TestDemo {
    @Test
    public void toAdd(){
        System.out.println("=======toAdd");
    }
    @Test
    public void toDel(){
        System.out.println("=======toDel");
    }
    @Test
    public void toUpdate(){
        System.out.println("=======toUpdate");
    }
    @Before
    public void beforeInfo(){
        System.out.println("=======beforeInfo");
    }
    @BeforeClass
    public static void beforeInfoClass(){
        System.out.println("=======beforeInfoClass");
    }
    @After
    public void afterInfo(){
        System.out.println("=======afterInfo");
    }
    @AfterClass
    public static void afterInfoClass(){
        System.out.println("=======afterInfoClass");
    }
}
