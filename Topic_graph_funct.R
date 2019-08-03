# create graphing function
topic.graph <- function(df, na.rm = TRUE, ...){
  
  # create list of counties in data to loop over 
  topic_list <- unique(df$topic)
  
  # create for loop to produce ggplot2 graphs 
  for (i in seq_along(topic_list)) { 
    
    # create plot for each county in df 
    plot <- 
      ggplot(subset(df, df$topic==topic_list[i]),
             aes(year, cntyr)) + 
      
      geom_smooth(method='lm',formula=y~x)+
      theme_classic()+
      ggtitle(paste("Topic:",Topicmodels$plot_ready$topic$caption[topic_list[i]]))+
      theme(plot.title = element_text(hjust = 0.5))
    
    
    # save plots as .png
    ggsave(plot, file=paste("results/",topic_list[i], ".png", sep=''), scale=2)
    
    # save plots as .pdf
    # ggsave(plot, file=paste(results, 
    #                        'projection_graphs/county_graphs/',
    #                        county_list[i], ".pdf", sep=''), scale=2)
    
    # print plots to screen
    # print(plot)
  }
}
