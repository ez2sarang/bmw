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
package kr.co.fcsoft.core.helper;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.internal.CriteriaImpl;
import org.hibernate.internal.util.SerializationHelper;
import org.hibernate.loader.criteria.CriteriaJoinWalker;
import org.hibernate.loader.criteria.CriteriaQueryTranslator;
import org.hibernate.persister.entity.OuterJoinLoadable;
import org.hibernate.transform.ResultTransformer;

import java.io.Serializable;

/**
 * Created by ez2sarang on 2014. 11. 10..
 */
public class HibernateUtil {
    public static long getRowCount(Criteria criteria, Projection...rowCountProjection) {
        CriteriaImpl criteriaImpl = (CriteriaImpl) criteria;

        Projection originalProjection = criteriaImpl.getProjection();
        ResultTransformer originalResultTransformer = criteriaImpl.getResultTransformer();

        long rows = 0;
        if(originalProjection == null) {
            if(rowCountProjection!=null&&rowCountProjection.length>0) {
                rows = Long.valueOf(criteria.setProjection(rowCountProjection[0]).uniqueResult().toString());
            } else {
                Object rowCount = criteria.setProjection(Projections.rowCount()).uniqueResult();
                if(null != rowCount) {
                    rows = Long.valueOf(rowCount.toString());
                }
            }
        } else {
            if(originalProjection.isGrouped()) {
                if(rowCountProjection!=null&&rowCountProjection.length>0) {
                    rows = Long.valueOf(criteria.setProjection(rowCountProjection[0]).uniqueResult().toString());
                } else {
                    Projection newProjection = criteriaImpl.getProjection();
                    rows = criteria.setProjection(newProjection).list().size();
                }
            } else {
                rows = Long.valueOf(criteria.setProjection(Projections.rowCount()).uniqueResult().toString());
            }
        }
        criteria.setProjection(originalProjection);
        criteria.setResultTransformer(originalResultTransformer);
        return rows;
    }

    public static String getSql(Criteria criteria) {
        CriteriaImpl criteriaImpl = (CriteriaImpl) criteria;
        SessionImplementor session = (SessionImplementor) criteriaImpl.getSession();
        SessionFactoryImplementor factory = session.getFactory();
        CriteriaQueryTranslator translator = new CriteriaQueryTranslator(
                factory
                , criteriaImpl
                , criteriaImpl.getEntityOrClassName()
                , CriteriaQueryTranslator.ROOT_SQL_ALIAS
        );
        String[] implementors = factory.getImplementors(criteriaImpl.getEntityOrClassName());

        CriteriaJoinWalker walker = new CriteriaJoinWalker(
                (OuterJoinLoadable) factory.getEntityPersister(implementors[0])
                , translator
                , factory
                , criteriaImpl
                , criteriaImpl.getEntityOrClassName()
                , session.getLoadQueryInfluencers()
        );
        return walker.getSQLString();
    }

    public static <T> T clone(T original) {
        T clonedObject = (T) SerializationHelper.clone((Serializable)original);
        return clonedObject;
    }
}
