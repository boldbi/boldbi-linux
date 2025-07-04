"""Contains functions that run the matomo pipeline."""
from matomo import matomo_reports, matomo_visits
import dlt


def run_full_load() -> None:
    """
    Does a basic run of the pipeline.
    """
    pipeline_reports = dlt.pipeline(
        dataset_name="{0}",
        export_schema_path="schemas/export",
        full_refresh={3},
        destination='{4}',
        staging = {5},
        pipeline_name="{0}_pipeline",
    )
    {1}


def run_custom_reports() -> None:
    """
    Defines some custom reports you can use and shows how to use for different custom reports
    """

    queries = [
        {
            "resource_name": "custom_report_name",
            "methods": ["CustomReports.getCustomReport"],
            "date": "2020-01-01",
            "period": "day",
            "extra_params": {"idCustomReport": 1},
        },
        {
            "resource_name": "custom_report_name2",
            "methods": ["CustomReports.getCustomReport"],
            "date": "2020-01-01",
            "period": "day",
            "extra_params": {"idCustomReport": 2},
        },
    ]
    site_id = 3
    pipeline_reports = dlt.pipeline(
        dataset_name="matomo_custom_reports",
        full_refresh=False,
        destination='{4}',
        staging = {5},
        pipeline_name="matomo",
    )
    data = matomo_reports(queries=queries, site_id=site_id)
    info = pipeline_reports.run(data)
    print(info)


def run_reports() -> None:
    """
    Runs the pipeline only loading reports.
    """

    # site id can also be assigned explicitly. Default is to read from config.toml
    site_id = 3
    pipeline_reports = dlt.pipeline(
        dataset_name="matomo_reports",
        full_refresh=False,
        destination='{4}',
        staging = {5},
        pipeline_name="matomo",
    )
    data = matomo_reports(site_id=site_id)
    info = pipeline_reports.run(data)
    print(info)


def run_live_events() -> None:
    """
    Runs the pipeline loading live visits and visitors data, getting only todays data
    """

    pipeline_events = dlt.pipeline(
        dataset_name="matomo_events",
        full_refresh=False,
        destination='{4}',
        staging = {5},
        pipeline_name="matomo",
    )
    data = matomo_visits(initial_load_past_days=1, get_live_event_visitors=True)
    info = pipeline_events.run(data)
    print(info)


if __name__ == "__main__":
    run_full_load()
