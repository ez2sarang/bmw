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
package kr.co.fcsoft.core.bean;

import java.util.Stack;

/**
 * 테스팅중
 * @author fcsoft
 *
 */
public interface Paging
{
	/**
	 * 표시되는 목록 갯 수
	 */
	Integer getListSize();
	void setListSize(Integer listSize);

	/**
	 * 표시되는 페이지 갯 수
	 */
	Integer getPageSize();
	void setPageSize(Integer pageSize);

	/**
	 * 현재페이지번호(기본값 1)
	 */
	Integer getCurrentPage();
	void setCurrentPage(Integer currentPage);

	/**
	 * 이전페이지 - 네비게이션할 목적으로 만들었지만, 웹에서 페이지 이동이 의미가 있을까 고민중...
	 */
	public Stack<Integer> preCurrentPage = new Stack<Integer>();
	
	/*public int getStartRowNum()
	{
		return getTotalRows() - (getCurrentPage() - 1) * getPageSize();
	}

	public int getRowNum(int i)
	{
		return getStartRowNum() - i;
	}

	public int getStartPage()
	{
		return ((currentPage - 1) / listSize) * listSize + 1;
	}

	public int getTotalPage()
	{
		return (totalRows - 1) / pageSize + 1;
	}

	public int getEndPage()
	{
		return (getTotalPage() - 1) / listSize != (currentPage - 1) / listSize ? ((currentPage - 1) / listSize)
		        * listSize + listSize
		        : getTotalPage();
	}

	public boolean hasPrevBlock()
	{
		return getStartPage() > 1;
	}

	public boolean hasNextBlock()
	{
		return getEndPage() < getTotalPage();
	}

	public boolean isFirstPage()
	{
		return currentPage == 1;
	}

	public boolean isLastPage()
	{
		return currentPage == getTotalPage();
	}
	*/
}