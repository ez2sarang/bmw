package org.mariapresso.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = {"org.mariapresso", "np.com.mshrestha.dropzonetest"}, excludeFilters = {@ComponentScan.Filter(type = FilterType.ANNOTATION, value = org.springframework.stereotype.Controller.class)})
@PropertySources(value = {@PropertySource("file:${catalina.home}/conf/impd/jdbc.properties")})
@EnableTransactionManagement(order = 1)
public class RootConfig {
    @Autowired
    private Environment env;

    public static final String REPOSITORY_PATH;
    public static final String REPOSITORY_TEMP_PATH;
    public static final String IMAGE_PREFIX;
    public static final String IMAGE_URL_FORM;
    static
    {
        Properties props = null;
        try
        {
            props = PropertiesLoaderUtils.loadProperties(new UrlResource("file:" + System.getProperty("catalina.home") + "/conf/impd/config.properties"));
            System.out.println("==RootConfig load ENV=======");
            System.out.println(props.getProperty("repository.path"));
            System.out.println(props.getProperty("image.url.prefix"));
            System.out.println(props.getProperty("image.url.form"));
            System.out.println("============================");
        }
        catch(Exception err)
        {
            err.printStackTrace();
            throw new ExceptionInInitializerError(err);
        }
        finally
        {
            REPOSITORY_PATH = props.getProperty("repository.path");
            REPOSITORY_TEMP_PATH = props.getProperty("repository.temp.path");
            IMAGE_PREFIX = props.getProperty("image.url.prefix");
            IMAGE_URL_FORM = props.getProperty("image.url.form");
        }
    }

    @Bean(name = "dataSource")
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl(env.getProperty("database.url"));
        dataSource.setUsername(env.getProperty("database.user"));
        dataSource.setPassword(env.getProperty("database.password"));
        dataSource.setInitialSize(env.getProperty("database.initialSize", Integer.class));
//        dataSource.setMaxActive(env.getProperty("database.maxActive", Integer.class));
        dataSource.setMaxIdle(env.getProperty("database.maxIdle", Integer.class));
        dataSource.setMinIdle(env.getProperty("database.minIdle", Integer.class));
//        dataSource.setMaxWait(env.getProperty("database.maxWait", Long.class));
//        dataSource.setm
        return dataSource;
    }

    /**
     * 2015-03-30 by ez2sarang
     * test...
     * If request parameter "targetUrl" is existed, then forward to this url
     * For update login form
     *
     * @param targetUrl
     * @return
     */
    /*@Bean(name = "savedRequestAwareAuthenticationSuccessHandler")
    public SavedRequestAwareAuthenticationSuccessHandler savedRequestAwareAuthenticationSuccessHandler(String targetUrl) {
        SavedRequestAwareAuthenticationSuccessHandler savedRequestAwareAuthenticationSuccessHandler = new SavedRequestAwareAuthenticationSuccessHandler();
        savedRequestAwareAuthenticationSuccessHandler.setTargetUrlParameter(targetUrl);
        return savedRequestAwareAuthenticationSuccessHandler;
    }*/
    @Autowired
    @Bean(name = "sessionFactory")
    public LocalSessionFactoryBean sessionFactory(DataSource dataSource) {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setPackagesToScan(new String[]{"org.mariapresso", "np.com.mshrestha.dropzonetest"});

        Properties hibernateProperties = new Properties();
        // hibernateProperties.put("hibernate.dialect",
        // "org.hibernate.dialect.MySQLDialect");
        hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQLInnoDBDialect");
        hibernateProperties.put("javax.persistence.validation.mode", "NONE");
        hibernateProperties.put("hibernate.jdbc.batch_size", 100);
//        hibernateProperties.put("hibernate.jdbc.lob.non_contextual_creation", true);
        hibernateProperties.put("hibernate.show_sql", true);
        hibernateProperties.put("hibernate.format_sql", true);
        hibernateProperties.put("hibernate.temp.use_jdbc_metadata_defaults", false);
        sessionFactory.setHibernateProperties(hibernateProperties);

        return sessionFactory;
    }

    @Autowired
    @Bean(name = "transactionManager")
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory);
        return transactionManager;

    }

    @Bean
    public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
        return new PersistenceExceptionTranslationPostProcessor();
    }

    // ----------------------------------------------------------------
    // ADI XML 생성 관련 설정
    // ----------------------------------------------------------------
    /*@Bean
    public Jaxb2Marshaller jaxb2Marshaller() {
        Jaxb2Marshaller marshaller = new Jaxb2Marshaller();
        marshaller.setContextPath("com.fast2.zimin.deploy.model.adi3i02xsd");
        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.setMarshallerProperties(properties);
        return marshaller;
    }

    @Bean
    public XMLFileConverter xmlFileConverter() {
        XMLFileConverter converter = new XMLFileConverter();
        converter.setMarshaller(jaxb2Marshaller());
        converter.setUnmarshaller(jaxb2Marshaller());
        return converter;
    }*/
    // ----------------------------------------------------------------
}
