@SpringBootApplication
public class BookingWebApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(BookingWebApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(BookingWebApplication.class);
    }
}
