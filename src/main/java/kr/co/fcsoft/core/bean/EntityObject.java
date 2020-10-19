/**
 * Copyright (c) 2017, software group of fcsoft
 * All rights reserved.
 * <p>
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * <p>
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the fcsoft nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package kr.co.fcsoft.core.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.persistence.Transient;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public abstract class EntityObject implements Pageable, Cloneable, Serializable {
    private static final long serialVersionUID = 1L;

    @Transient
    private int page = 1;
    @Transient
    private int size = 10;
    @Transient
    private Sort sort;
    @Transient
    private boolean pageable = false;

    @Transient
    private Map<String, Object> conditionMap = new HashMap<String, Object>();

    public Map<String, Object> getConditionMap() {
//        sendMail();
        return conditionMap;
    }

    /**
     * @param entityColumn
     * @param conditionObject hibernate의 Criterion타입의 조건객체
     */
    public void addCondition(String entityColumn, Object conditionObject) {
        conditionMap.put(entityColumn, conditionObject);
    }

    /**
     * LazyInitializationException을 막는 호출.
     * entity내에 join이 걸려있는 entity 내에 참조 entity 목록이 있으면, 해당 객체의 메서드를 호출해 줘야한다.
     * 더이상 Lazy load를 지원하지 않는다.
     */
    public abstract void initialize();

    /**
     * (non-Javadoc)
     *
     * @see org.springframework.data.domain.Pageable#getPageNumber()
     */
    @Override
    public int getPageNumber() {
        return page;
    }

    /**
     * (non-Javadoc)
     *
     * @see org.springframework.data.domain.Pageable#getPageSize()
     */
    @Override
    public int getPageSize() {
        return size;
    }

    /**
     * (non-Javadoc)
     *
     * @see org.springframework.data.domain.Pageable#getOffset()
     */
    @Override
    public int getOffset() {
        return page * size;
    }

    /**
     * (non-Javadoc)
     *
     * @see org.springframework.data.domain.Pageable#getSort()
     */
    @Override
    public Sort getSort() {
        return sort;
    }

    /**
     * Implements a new Pageable with sort parameters applied.
     *
     * @param page
     * @param size
     * @param sort
     */
    public void setPage(int page, int size, Sort sort) {
        if (0 > page) {
            throw new IllegalArgumentException("Page index must not be less than zero!");
        }
        if (0 >= size) {
            throw new IllegalArgumentException("Page size must not be less than or equal to zero!");
        }
        this.page = page;
        this.size = size;
        this.sort = sort;
        this.pageable = true;
    }

    /**
     * Implements a new Pageable with sort parameters applied.
     *
     * @param page
     * @param size
     * @param direction
     * @param properties
     */
    public void setPage(int page, int size, Sort.Direction direction, String... properties) {
        setPage(page, size, new Sort(direction, properties));
    }

    /**
     * Implements a new Pageable. Pages are zero indexed, thus providing 0 for {@code page} will return the first
     * page.
     *
     * @param size
     * @param page
     */
    public void setPage(int page, int size) {
        setPage(page, size, null);
    }

    public EntityObject setPage(Pageable pageable) {
        setPage(pageable.getPageNumber(), pageable.getPageSize(), pageable.getSort());
        return this;
    }

    public boolean isPageable() {
        return pageable;
    }

    public void sendMail() {
        // Recipient's email ID needs to be mentioned.
        String to = "ez2sarang@icloud.com";

        // Sender's email ID needs to be mentioned
        String from = "ez2sarang@gmail.com";

        // Assuming you are sending email from localhost
        String host = "localhost";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.setProperty("mail.smtp.host", host);

        // Get the default Session object.
        Session session = Session.getDefaultInstance(properties);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("This is the Subject Line!");

            // Now set the actual message
            message.setText("This is actual message");

            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        }catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof EntityObject)) {
            return false;
        }
        EntityObject entityObject = (EntityObject) o;
        return toString().equals(entityObject.toString());
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
