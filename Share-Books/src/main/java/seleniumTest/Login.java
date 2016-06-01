package seleniumTest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;


public class Login {

	WebDriver  driver;
	WebElement element;
	String     str;

	public String getString() {
		return str;
	}
	
	public boolean start() {
		try{
			driver = new FirefoxDriver();
			
			//go to website
			driver.get("http://localhost:8080/Share-Books");
			
			//click login button
			driver.findElement(By.name("login")).click();
			
			//key in the email
			element = driver.findElement(By.name("email"));
			element.sendKeys("aaa01");
			
			//key in the password
			element = driver.findElement(By.name("password"));
			element.sendKeys("bbb01");
			
			//click login button
			driver.findElement(By.xpath("/html/body/form/input[3]")).click();
			
			str = driver.findElement(By.tagName("h1")).getText();
			
			driver.close();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
