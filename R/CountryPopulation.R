#' Plot Population Growth for a Given Country
#'
#' This function takes a country name as input and returns a ggplot object displaying the population growth from 1950 to 2020.
#' The plot is in black and white, with the country's name at the top as the title.
#'
#' @param country_name The name of the country for which the population growth plot is desired.
#' @return A ggplot object showing the population trend.
#' @export
#' @examples
#' CountryPopulation("Brazil")
CountryPopulation <- function(country_name) {
  if(!country_name %in% WorldPopulation$`Country Name`) {
    stop("Country name not found in the WorldPopulation dataset.")
  }

  data_to_plot <- WorldPopulation %>%
    filter(`Country Name` == country_name) %>%
    pivot_longer(
      cols = -`Country Name`,
      names_to = "Year",
      values_to = "Population"
    ) %>%
    mutate(Year = as.numeric(Year))

  ggplot(data_to_plot, aes(x = Year, y = Population)) +
    geom_line() +
    labs(
      title = paste("Pop. Growth from 1950-2020:", country_name),
      x = "Year",
      y = "Population"
    ) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))
}

