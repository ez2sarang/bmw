/**
 * Copyright (c) 2017, software group of fcsoft
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the fcsoft nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package kr.co.fcsoft.core.dao;

import kr.co.fcsoft.core.bean.EntityObject;
import kr.co.fcsoft.core.bean.SearchListResult;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.io.Serializable;

public interface ObjectDao {

    Page<?> findAll() throws RuntimeException;

    Page<?> findAllSorted(EntityObject entityObject) throws RuntimeException;

    Page<?> findList(EntityObject entityObject) throws RuntimeException;

    int findListCnt(EntityObject entityObject) throws RuntimeException;

    EntityObject findObject(EntityObject entityObject)throws RuntimeException;

    Serializable save(EntityObject entityObject) throws RuntimeException;

    void saveOrUpdate(EntityObject entityObject) throws RuntimeException;

    /**
     * 엔티티를 변경 하거나 해당하는 엔티티 목록을 변경한다.
     * @param entity 변경할 엔티티 또는 검색할 엔티티
     * @param willBeChangedValue 검색을 한 엔티티를 모두 변경할 경우 사용됨
     * @throws RuntimeException
     */
    void update(EntityObject entity, EntityObject... willBeChangedValue)throws RuntimeException;

    void delete(EntityObject entityObject)throws RuntimeException;

    int deleteBySearchList(EntityObject entityObject) throws RuntimeException;
}
