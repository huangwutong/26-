
本包类的结构如下：

                              Action(org.apache.struts.action)
                                |
                           ActionExtend(web.struts)
                           		|
                          DlogActionBase(dlog4j.action)
                                /\
                               /  \
                              /    \ 
                 DlogLogAction		AdminActionBase                 
             DlogMessageAction                    \
              DlogSearchAction					   \              
           DlogTrackBackAction						DlogCategoryAction
              DlogUploadAction						DlogFavoriteAction              
                DlogUserAction						DlogParamAction
                									DlogSiteAction
                  