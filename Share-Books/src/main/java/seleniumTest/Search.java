package seleniumTest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

public class Search {
	
	WebDriver  driver;
	WebElement element;
	String     bookName;
	
	public String getBookName() {
		return bookName;
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
			
			//key in the keyword
			element = driver.findElement(By.name("keyword"));
			element.sendKeys("R");
			//click search button
			driver.findElement(By.xpath("/html/body/form[1]/input[2]")).click();
			
			bookName = driver.findElement(By.linkText("數據分析：R 語言實戰")).getText();
			driver.close();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
