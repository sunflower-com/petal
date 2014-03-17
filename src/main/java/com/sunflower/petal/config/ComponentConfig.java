package com.sunflower.petal.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ComponentScan(basePackages = "com.sunflower.petal")
@PropertySource("classpath:fileUpload.properties")
public class ComponentConfig {

}