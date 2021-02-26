{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 8,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ -197.0, -917.0, 594.0, 678.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "s4m",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 313.700002789497375, 225.199999988079071, 124.0, 22.0 ],
					"text" : "read event-score.scm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 115.0, 8.0, 59.0, 22.0 ],
					"text" : "port 7777"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.733331799507141, 260.199999988079071, 31.0, 22.0 ],
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-18",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 370.400002688169479, 458.200000047683716, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"int" : 1,
					"maxclass" : "gswitch2",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 275.400002688169479, 558.200000047683716, 39.0, 32.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 275.400002688169479, 599.200000047683716, 47.0, 22.0 ],
					"text" : "s #0_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 323.400002688169479, 553.200000047683716, 103.0, 22.0 ],
					"text" : "lfo-1 0.936435"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.400002688169479, 522.200000047683716, 49.0, 22.0 ],
					"text" : "lfo-1 $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 280.400002688169479, 491.200000047683716, 88.0, 22.0 ],
					"text" : "snapshot~ 16n"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 370.400002688169479, 491.200000047683716, 56.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 280.400002688169479, 458.200000047683716, 53.0, 22.0 ],
					"text" : "cycle~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.233331799507141, 225.199999988079071, 91.0, 22.0 ],
					"text" : "read etude.scm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 201.399998605251312, 260.199999988079071, 31.0, 22.0 ],
					"text" : "play"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 57.233331799507141, 225.199999988079071, 100.0, 22.0 ],
					"text" : "read players.scm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 72.700005829334259, 756.0, 31.0, 22.0 ],
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "bang" ],
					"patching_rect" : [ 72.700005829334259, 783.0, 42.0, 22.0 ],
					"text" : "t 0 0 b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "bang" ],
					"patching_rect" : [ 16.0, 783.0, 42.0, 22.0 ],
					"text" : "t 1 1 b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 756.0, 32.0, 22.0 ],
					"text" : "start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 16.0, 827.666670262813568, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 16.0, 857.666670262813568, 113.0, 22.0 ],
					"text" : "metro 4n @active 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 44.833333194255829, 505.0, 29.5, 22.0 ],
					"text" : "join"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 42.833333194255829, 446.0, 65.0, 22.0 ],
					"text" : "unpack i i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 44.833333194255829, 478.0, 61.0, 22.0 ],
					"text" : "makenote"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 7,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patching_rect" : [ 44.833333194255829, 531.0, 82.0, 22.0 ],
					"text" : "midiformat"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 44.833333194255829, 686.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"orientation" : 1,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 37.833333194255829, 602.5, 97.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.gain~",
							"parameter_mmax" : 6.0,
							"parameter_mmin" : -70.0,
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4
						}

					}
,
					"varname" : "live.gain~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 134.0, 531.0, 31.0, 22.0 ],
					"text" : "plug"
				}

			}
, 			{
				"box" : 				{
					"autosave" : 1,
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 8,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "", "list", "int", "", "", "" ],
					"patching_rect" : [ 37.833333194255829, 566.0, 92.5, 22.0 ],
					"save" : [ "#N", "vst~", "loaduniqueid", 0, ";" ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_invisible" : 1,
							"parameter_longname" : "vst~",
							"parameter_shortname" : "vst~",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"parameter_enable" : 1,
						"parameter_mappable" : 0
					}
,
					"snapshot" : 					{
						"filetype" : "C74Snapshot",
						"version" : 2,
						"minorversion" : 0,
						"name" : "snapshotlist",
						"origin" : "vst~",
						"type" : "list",
						"subtype" : "Undefined",
						"embed" : 1,
						"snapshot" : 						{
							"pluginname" : "Pianoteq 6.vst3",
							"plugindisplayname" : "Pianoteq 6",
							"pluginsavedname" : "/Library/Audio/Plug-Ins/VST3/Pianoteq 6.vst3",
							"pluginsaveduniqueid" : 0,
							"version" : 1,
							"isbank" : 0,
							"isbase64" : 1,
							"blob" : "5702.VMjLgziE...OVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9PiLxDiKV0zQicUPt3hKl4hKt3BTt3hKt3hKLoGVzMGQt3hKQkkQIoGTtEjKt3BRtPkdYMkXtfkYA4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt7jdL4FVNc1JB4hKt3hYD4jTt.kYO4hKtDjKt3hKDEjSVc1Ti8jKt3BTI0VUKEjPt3BRtXkQQUDUqgiKt3hat3hKtXFS1gzTLUmKowTcHMDSW4hKt3hKUo0YzDSX5UkUhYFVosTLyHDS0gzPLcmZCwDMDkWSFclKkU1bYYEM0cSUh8DNr0TRyQ0ZQYTXxUjQI8jKt3hdQYzXM8VLt3hK1QjKt3hKVsFaXgWQFIla3vVXqEDZUMmdDgzT3vVV5EjKt3hK1EjKt3hKMgiQYcVRGMldUIjKt3hKU4VUFgjUvH0TlgUUZgVRWgkcmESXzUkQHIyZFMlaAgmX0kkQiYldVgkb2YUV50TaK4hKt3hKPQjKt3hcD4hKt3hUqwFV3UjQh4FNrE1ZAgVUyoGQHMENrkkdA4hKt3BTt3hKt3RPt3hKtPkKt3hKPEjKt3hKEUzUic1cF4hKt3hKgsjKt3hXpQUUUUjKt3hYA4hKt3RPL4hcME0ZhEWPt3hPTwjKqrjYCYlaTgUZEc0Xq0zQHIENrEVaEYjKPg2TNEjTBY1MtXFRPkSZPkSPy7jKDEjZtrlZlYVPHAkKlIjZCM1TlolKy.kKtIjZJAiZlwVPtIkKtXjZG0TUm0ja3gDQPklRFo1TGokKTkjZtfTStfkYJ4BSAAkKhEkStfkaHAUL4sTUPoFRD4lTIMjZSkDQPkGRk4hdFMVPHAkKyH0StnWPQ4BSHEDTwjlSsEjaJ4haQ8jKlEkStPkKM4BSBoVNLkmYw3haO4xLAoVdTglK0ciPAQyMAMjKjQjKC4BMOMTQtEjK4LjKAgmcL4hd3sjKTAkStH1LCAEb4QUPFEjY03hcHAEcSMkPZcjY13hYSAUM4gzMA41StfUQpczZvXVRtLSTtH1PpUTSUcVTHQjSHI2PQ0jY3sjPyj2RVIVZFojKy3jKlYFTtbiYO4hbtnjKtjWStPDRJUTPPc1TtjjRyo1cMcFSyjkM5klRtflPtj1bC4xThMjKCETROITRXckK3MjKAUiKpICRBIzbtgVP3nlZlASPX8jKTMiVy4hKAIiKPYFbAkjSIUjaF4BZC4RZtjkS3vDRA4BaC4BdtjzS2QDRK4BdC4RNtPCTtjjag4hSD4RLAkDT5A0LYAiZCEDMLMTP2vzPM4hUC4hQ1MjKGo1PtbjREoFMpMUP2fjdt.CTCIDdxMDTtHDQt7FRC4RPw3hZ3QjclsTPX4jKX4xStPzYL4hYP0jKT4hZCUDLl4TPy.kKPIjZtjDUmMjYC4zYxklRFIGdKsDUSgjTtfjStPEdJ4BV14jK2.UStf0LRAEZowzaxgFTLQUdLMmbCQjKAgjStf0cN4xLBAkKXMSQP4jdVMDcFY1PA4xPPkSdRkkKynjK1AUStvDVEshKP4DT0L0TCEiQlkiKPYVSt71SIEkcPMURl4TSAgGSzPDQlkmK1QzPAAUQ03BTAkiKPcFYA8FSJEETN0TRP8zPQYFTAUDRQ4hRC4RPFcFTtvzTN4BUQ8jK1IjZyfDZtbyLBEzctI0PA81TQ4BZC4xQDMjKiY2PtHGQD4xP3IjZ1AEQAIiY4MjMxoVPt.CUlsjKHAkKhcmStfkcM4hXAwjKPgjKt4BQt.mKD4RbtPjKy4BQtTmKD4hctPjK24BQtfmKD4RdtPjK54BQt.iKD4hLtPjKy3BQtPiKD4RMtPjK13BQtbiKD4BNtPjK43BQtrhKD4hKAQjKAEDQtHTPD4xPAQjKDEDQtTTPD4xQAQjKJEDQtrxJB4BTIIiXU8VMB4hKP0jKt3hKB4hKt3BVswjKt3hKtLiKt3hKlU0aIwlXmEzQZUGMVkkYXU0RMEjKt3hKt3hKt3hKC4hKt3BSt3hKt3hKtXlVP4hKtHlPA4hKXsjdt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BSt3hKt.kKt3hKt3hKt3hKt3hKt3hct3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3hKt3hKt3hKt3hKt3hKt3hKL4hKt3BTt3hKt3RPt3hKtPjKt3hKt3hKtLySt3hKt3BQt3hKt3hKt3hKtP2by0TNL4hKt3hYt3hKt3hKt3BbAEjKtDiRp4hKt3hKt3hKlshKt3hK4LjKt3hKt3hKtDiPA4hKt3hct3hKt3RPt3hKt3hKtXWRT4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BTt3hKt3hKt3hKt3hKt3hKt3hKtnjct3hKt4RPt3hKtXmKt3hKtHjKt3hKt3hKtYDQt3hYyAkPt3hKt3hKt3hKt3hKt3hKt3hKt3BSt3hKtXlKt3hKt3hKt.WPA4hKXsjZt3hKt3hKt3hYq3hKt3RNC4hKt3hKtHjKt3hKt3hKtXldD4hKt3hKtX1JL4hKt3BTt3hKt3hKt3hXBUjKt3hKt3hKt3hKt3hKt3BSt3hKtXlKt3hKt3hKt.WPA4hKXsjZt3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3BRt3hKt3hKtXlVP4hKtDiPI4hKt3hKt3hKy7jKt3hYq3hKt3hKl4hKt3hKA4hKt3BUE4hKt.UT2U0UXIWPBM1ZvXjXqkzUXMWUrEldu4RUtUkQHkWTWgEcQYEV3EkQHoWUsE1azDSVx4Bdi4VUrI1ZAIzXtUkQHUWSFM1YYcUVloVLhYFTVoULqYTVqEkQH8FMFgzcHMDRqUzUic1cFgTdQcUV10TaKwjKt3hKt3hKHsDQt3hY5AkKtX1ZCEjKtfzSD4hKtsBTt3hYEQTPt3RcPQjKtXFQQ4hKPgEQA4hK0DEQt3BaHEkKtX1ZDUjKt3hKt3hKt3hKD4hKt3hKt3hXOQzSt3hKtTTPt3hKXQjKt3hKtrRPt3hKt3hKt3hcA4hKt3BQUwVVmU0QgoWPt3hKt3hKt3hKtLjKt3hKH4hKt3hKt3hYZAkKt3RLBkjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtkEaYkyPt3hKy7zPt3hKtfjKt3hKt3hKloETt3hKwHTRt3hKt3hKt3xLO4hKtX1Jt3hKt3hct3hKt3hPt3hKt3hKt3lQD4hKlMGTB4hKt3hKt3hK4LjKt3xLO4hKt3hKt3hKt3hct3hKt3RPt3hKt3hKtXWRT4hKt3hKt3hKt3hKt3hKt3hKt3xLOMjKt3hKD4hKt3hKt3hKsAUPt3hKt3hKt3hKt3hKt3hKA4hKt3hKt3hKt3hKt3hKtzTdLkGNwvTdLIyTt3hKt3hKt3hKt3hKt3hKt3hKtXWct3hKtrhKt3hK4jmKt3hKtLjKt3hKt3hKtYDQt3hKsAkKt3RLB0jKt3hKt3hKtLySt3hKlshKt3hK4LjKt3hKt3hKt3hKL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtX1JL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKlshKt3hK4LjKt3hKt3hKtHlPM4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtX1JL4hKt3hct3hKt3hKt3BbAEjKtXWRD4hKlMGTC4hKt3hKt3hK4LjKt3xLO4hKtX1Jt3hKt3hct3hKt3hKt3hKtPjKt3hKt3hKt3hKt3hKt3BQt3hKtXmKt3hKtHjKt3hKt3hKt3hKt3hKy7jPt3hKt3hKt3hKt3hKtLySt3hKt3BSt3hKtXlKt3hKt3hKt3hKt3hKtjSZt3hKt3hKt3hYq3hKt3RNC4hKt3hKC4hKt3BTt3hKt3hKt3hKtvFSYIUNyTWYqbyPt3hKy7DQt3hKt3hKt3hKt3hKt3hKt3hKlshKt3hK4LjKt3hKtLjKt3hKH4hKt3hKt3hKt3hKt3hYqfjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtnEaYYzJL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKlshKt3hK4LjKt3hKt3hKtX1JB4hKtbSdt3hKt3hPt3hKt3hKt3xQD4hKtHGTB4hKt3hKt3hK4LjKt3xLO4hKt3hKD4hKt3BTt3hKt3RPt3hKt3lKt3hK1Q0bEYTXxEjPRc1cFE1Rt3hKtnmUYo1ZVM1bmYEVxcmULMyMZciKgQCLHgDQt3hKy7TQ24BRtDjKt3hKtjWXHszSt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKv4DQt3hKt3hKt3hYqPkKt3hKt3hKtLySt3hKlsBSt3hKtXmKt3hKt3hKt.WPA4hK1kDQt3hYyA0Pt3hKt3hKt3RNC4hKtLySt3hKlshKt3hKtXmKt3hKtLjKt3hKt3hKtYDQt3hKsAkKt3RLB0jKt3hKt3hKtLySt3hKlshKt3hK4LjKt3hKt3hKt3hKL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKt3hKt3hKt3hKt3hKtLjKt3hK5wTdLsxT1YUd17DQZ8Fc4vjKt3hK14hKt3hKt3hKvETPt3hcIQjKtX1bPMjKt3hKt3hKtjyPt3hKy7jKt3hYq3hKt3hK14hKt3hKC4hKt3hKt3haFQjKt3RaP4hKtDiPM4hKt3hKt3hKy7jKt3hYq3hKt3RNC4hKt3hKC4hKt3BSt3hKt3hKtXlVP4hKtHlPA4hKXsjdt3hKt3hKt3hYq3hKt3RNC4hKtLySt3hKt3hKt3hK4LjKt3xLOYjKt3hKt3hKtjSZrkEam8jKt3hKq3hKt3RNSkGS4QySH4hKt3hKt3hKCQjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3BSt3hKt3hKtXlVP4hKtHlPA4hKXsjdt3hKt3hKt3hYq3hKt3RNC4hKtLySt3hKt3BSt3hKtXmKt3hKt3hKt.WPA4hK1kDQt3hYyA0Pt3hKt3hKt3RNC4hKtLySt3hKlshKt3hKtXmKt3hKtLjKt3hKt3hKtYDQt3hKsAkKt3RLB0jKt3hKt3hKtLySt3hKlshKt3hK4LjKt3hKtLjKt3hKL4hKt3hKt3hYZAkKt3hXBEjKtf0R54hKt3hKt3hKlshKt3hK4LjKt3xLO4hKt3hKD4hKt3BTt3hKt3hKt3hXB0jKt3hKP4hKt3hKt3hKt3BQt3hKt3hKt3hKt3hKt3hKpYCRzYSdt3hKt3hPt3hKt3hKtPURD4hKtDGTB4hKt3hKt3hK4LjKt3xLO4hKt3hKD4hKt3hKt3hKt3RPt3hKtvTdLk2MokEaYUySA4hKt3hKt3hKt.kKt3hKtjGS4wzJXwVVrkyTt3hKt3hKt3hKt3hKtX2RD4hKt3hKN4hKt3hKt3hK2LUdLkmXO0TdLMUNt3hKtbyPA4hKt3hPt3hKtXlKt3hK1EjKt3hKA4hKt3BQt3hKt.kKt3hKtDjKt3hKD4hKt3hct3hKt3RPt3hKtPjKt3hKt3hKt3hKN4hKt3hKA4hKt3hKt3hKt3hKtXlKA4hKt3BQt3hKt3hKt3hYq3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3hKt3hKt3hKt3hKt3hKt3hKy3hKt3hKD4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKL4hKt3hKt3hKt3hKt3hKt3hKt3hKlMjKt3hKP4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKP4hKt3hKA4hKt3hKt3hK4LjKt3BU14hKt3hKH4hKt3hct3hKt3RPt3hKtPkKt3hKtDjKt3hKA4hKt3BSt3hKtXFaYw1aOoEaYYzJNkGS4kyPt3hKt3hKt3hKt3hKt3hKPEjKt3hKt3hKt3hKt3hKKwjKt3hb14hKtXmPC4hKtrjXA4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt.UPt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKP4hKt3hKt3hKt3BTt3hKt.kKt3hKtLjKt3hKXwVVrgSZrkEa2UWdLkmbq3hKt3hKt3hKt3hKt3hKt3BUt3hKt3hKt3hb14hKt3hKt3hKtrDSt3hKxYmKt3hcBckKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKT4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BQt3hKt3hKt3hKtPjKt3hKt3hKt3hct3hKt3xSJIFNqnWZBcEN1bTQzEySt3hKyITPt3hKt3hKt3hKtTjKt3hKt3hKtTDSt3hKTYmKt3hXBMjKtXWRL4hKtzlcE4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3RQt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtDjKt3hKt3hKt3hKA4hKt3hKt3hKtvjKt3hK1wTdLkWchgia1kyL0D0Y3LjKt3hKt3hKt3hKt3hKt3BTA4hKt3hKt3BTAMjKt3RQL4hKtzlct3hKhIzPt3hcIIVPt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKPEjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BTt3hKt3hKt3hKt.kKt3hKt3hKt3hKC4hKt3hYwcTQqL0SJIFLOQGYTMyJt3hKt3hKt3hKt3hKt3hKtPkKt3hKt3hKtPkct3hKPEzPt3hcIwjKt3Ra14hKtHlPW4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BUt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtPjKt3hKt3hKt3hKt3hKt3hKt3hKt.kKt3hKtLjKt3hKtkEaYcSZrkEa2UWdLkmbq3hKt.kQD4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hYRUUSTEETIckVwTjQisVTTgkdEYjKAQjYPQSPWgUdMcjKAQjct3hdA4hKt3hKt3hKtnTUv.UQAslXuk0UXoWUFE0YQcEV77RRC8Vav8lak4Fc9vyKVMEUy.Ea0cVZtMEcgQWY9.."
						}
,
						"snapshotlist" : 						{
							"current_snapshot" : 0,
							"entries" : [ 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Podolski 1.2.2",
									"origin" : "Pianoteq 6.vst3",
									"type" : "VST3",
									"subtype" : "Instrument",
									"embed" : 1,
									"snapshot" : 									{
										"pluginname" : "Pianoteq 6.vst3",
										"plugindisplayname" : "Pianoteq 6",
										"pluginsavedname" : "/Library/Audio/Plug-Ins/VST3/Pianoteq 6.vst3",
										"pluginsaveduniqueid" : 0,
										"version" : 1,
										"isbank" : 0,
										"isbase64" : 1,
										"blob" : "5702.VMjLgziE...OVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9PiLxDiKV0zQicUPt3hKl4hKt3BTt3hKt3hKLoGVzMGQt3hKQkkQIoGTtEjKt3BRtPkdYMkXtfkYA4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt7jdL4FVNc1JB4hKt3hYD4jTt.kYO4hKtDjKt3hKDEjSVc1Ti8jKt3BTI0VUKEjPt3BRtXkQQUDUqgiKt3hat3hKtXFS1gzTLUmKowTcHMDSW4hKt3hKUo0YzDSX5UkUhYFVosTLyHDS0gzPLcmZCwDMDkWSFclKkU1bYYEM0cSUh8DNr0TRyQ0ZQYTXxUjQI8jKt3hdQYzXM8VLt3hK1QjKt3hKVsFaXgWQFIla3vVXqEDZUMmdDgzT3vVV5EjKt3hK1EjKt3hKMgiQYcVRGMldUIjKt3hKU4VUFgjUvH0TlgUUZgVRWgkcmESXzUkQHIyZFMlaAgmX0kkQiYldVgkb2YUV50TaK4hKt3hKPQjKt3hcD4hKt3hUqwFV3UjQh4FNrE1ZAgVUyoGQHMENrkkdA4hKt3BTt3hKt3RPt3hKtPkKt3hKPEjKt3hKEUzUic1cF4hKt3hKgsjKt3hXpQUUUUjKt3hYA4hKt3RPL4hcME0ZhEWPt3hPTwjKqrjYCYlaTgUZEc0Xq0zQHIENrEVaEYjKPg2TNEjTBY1MtXFRPkSZPkSPy7jKDEjZtrlZlYVPHAkKlIjZCM1TlolKy.kKtIjZJAiZlwVPtIkKtXjZG0TUm0ja3gDQPklRFo1TGokKTkjZtfTStfkYJ4BSAAkKhEkStfkaHAUL4sTUPoFRD4lTIMjZSkDQPkGRk4hdFMVPHAkKyH0StnWPQ4BSHEDTwjlSsEjaJ4haQ8jKlEkStPkKM4BSBoVNLkmYw3haO4xLAoVdTglK0ciPAQyMAMjKjQjKC4BMOMTQtEjK4LjKAgmcL4hd3sjKTAkStH1LCAEb4QUPFEjY03hcHAEcSMkPZcjY13hYSAUM4gzMA41StfUQpczZvXVRtLSTtH1PpUTSUcVTHQjSHI2PQ0jY3sjPyj2RVIVZFojKy3jKlYFTtbiYO4hbtnjKtjWStPDRJUTPPc1TtjjRyo1cMcFSyjkM5klRtflPtj1bC4xThMjKCETROITRXckK3MjKAUiKpICRBIzbtgVP3nlZlASPX8jKTMiVy4hKAIiKPYFbAkjSIUjaF4BZC4RZtjkS3vDRA4BaC4BdtjzS2QDRK4BdC4RNtPCTtjjag4hSD4RLAkDT5A0LYAiZCEDMLMTP2vzPM4hUC4hQ1MjKGo1PtbjREoFMpMUP2fjdt.CTCIDdxMDTtHDQt7FRC4RPw3hZ3QjclsTPX4jKX4xStPzYL4hYP0jKT4hZCUDLl4TPy.kKPIjZtjDUmMjYC4zYxklRFIGdKsDUSgjTtfjStPEdJ4BV14jK2.UStf0LRAEZowzaxgFTLQUdLMmbCQjKAgjStf0cN4xLBAkKXMSQP4jdVMDcFY1PA4xPPkSdRkkKynjK1AUStvDVEshKP4DT0L0TCEiQlkiKPYVSt71SIEkcPMURl4TSAgGSzPDQlkmK1QzPAAUQ03BTAkiKPcFYA8FSJEETN0TRP8zPQYFTAUDRQ4hRC4RPFcFTtvzTN4BUQ8jK1IjZyfDZtbyLBEzctI0PA81TQ4BZC4xQDMjKiY2PtHGQD4xP3IjZ1AEQAIiY4MjMxoVPt.CUlsjKHAkKhcmStfkcM4hXAwjKPgjKt4BQt.mKD4RbtPjKy4BQtTmKD4hctPjK24BQtfmKD4RdtPjK54BQt.iKD4hLtPjKy3BQtPiKD4RMtPjK13BQtbiKD4BNtPjK43BQtrhKD4hKAQjKAEDQtHTPD4xPAQjKDEDQtTTPD4xQAQjKJEDQtrxJB4BTIIiXU8VMB4hKP0jKt3hKB4hKt3BVswjKt3hKtLiKt3hKlU0aIwlXmEzQZUGMVkkYXU0RMEjKt3hKt3hKt3hKC4hKt3BSt3hKt3hKtXlVP4hKtHlPA4hKXsjdt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BSt3hKt.kKt3hKt3hKt3hKt3hKt3hct3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3hKt3hKt3hKt3hKt3hKt3hKL4hKt3BTt3hKt3RPt3hKtPjKt3hKt3hKtLySt3hKt3BQt3hKt3hKt3hKtP2by0TNL4hKt3hYt3hKt3hKt3BbAEjKtDiRp4hKt3hKt3hKlshKt3hK4LjKt3hKt3hKtDiPA4hKt3hct3hKt3RPt3hKt3hKtXWRT4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BTt3hKt3hKt3hKt3hKt3hKt3hKtnjct3hKt4RPt3hKtXmKt3hKtHjKt3hKt3hKtYDQt3hYyAkPt3hKt3hKt3hKt3hKt3hKt3hKt3BSt3hKtXlKt3hKt3hKt.WPA4hKXsjZt3hKt3hKt3hYq3hKt3RNC4hKt3hKtHjKt3hKt3hKtXldD4hKt3hKtX1JL4hKt3BTt3hKt3hKt3hXBUjKt3hKt3hKt3hKt3hKt3BSt3hKtXlKt3hKt3hKt.WPA4hKXsjZt3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3BRt3hKt3hKtXlVP4hKtDiPI4hKt3hKt3hKy7jKt3hYq3hKt3hKl4hKt3hKA4hKt3BUE4hKt.UT2U0UXIWPBM1ZvXjXqkzUXMWUrEldu4RUtUkQHkWTWgEcQYEV3EkQHoWUsE1azDSVx4Bdi4VUrI1ZAIzXtUkQHUWSFM1YYcUVloVLhYFTVoULqYTVqEkQH8FMFgzcHMDRqUzUic1cFgTdQcUV10TaKwjKt3hKt3hKHsDQt3hY5AkKtX1ZCEjKtfzSD4hKtsBTt3hYEQTPt3RcPQjKtXFQQ4hKPgEQA4hK0DEQt3BaHEkKtX1ZDUjKt3hKt3hKt3hKD4hKt3hKt3hXOQzSt3hKtTTPt3hKXQjKt3hKtrRPt3hKt3hKt3hcA4hKt3BQUwVVmU0QgoWPt3hKt3hKt3hKtLjKt3hKH4hKt3hKt3hYZAkKt3RLBkjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtkEaYkyPt3hKy7zPt3hKtfjKt3hKt3hKloETt3hKwHTRt3hKt3hKt3xLO4hKtX1Jt3hKt3hct3hKt3hPt3hKt3hKt3lQD4hKlMGTB4hKt3hKt3hK4LjKt3xLO4hKt3hKt3hKt3hct3hKt3RPt3hKt3hKtXWRT4hKt3hKt3hKt3hKt3hKt3hKt3xLOMjKt3hKD4hKt3hKt3hKsAUPt3hKt3hKt3hKt3hKt3hKA4hKt3hKt3hKt3hKt3hKtzTdLkGNwvTdLIyTt3hKt3hKt3hKt3hKt3hKt3hKtXWct3hKtrhKt3hK4jmKt3hKtLjKt3hKt3hKtYDQt3hKsAkKt3RLB0jKt3hKt3hKtLySt3hKlshKt3hK4LjKt3hKt3hKt3hKL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtX1JL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKlshKt3hK4LjKt3hKt3hKtHlPM4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtX1JL4hKt3hct3hKt3hKt3BbAEjKtXWRD4hKlMGTC4hKt3hKt3hK4LjKt3xLO4hKtX1Jt3hKt3hct3hKt3hKt3hKtPjKt3hKt3hKt3hKt3hKt3BQt3hKtXmKt3hKtHjKt3hKt3hKt3hKt3hKy7jPt3hKt3hKt3hKt3hKtLySt3hKt3BSt3hKtXlKt3hKt3hKt3hKt3hKtjSZt3hKt3hKt3hYq3hKt3RNC4hKt3hKC4hKt3BTt3hKt3hKt3hKtvFSYIUNyTWYqbyPt3hKy7DQt3hKt3hKt3hKt3hKt3hKt3hKlshKt3hK4LjKt3hKtLjKt3hKH4hKt3hKt3hKt3hKt3hYqfjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtnEaYYzJL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKlshKt3hK4LjKt3hKt3hKtX1JB4hKtbSdt3hKt3hPt3hKt3hKt3xQD4hKtHGTB4hKt3hKt3hK4LjKt3xLO4hKt3hKD4hKt3BTt3hKt3RPt3hKt3lKt3hK1Q0bEYTXxEjPRc1cFE1Rt3hKtnmUYo1ZVM1bmYEVxcmULMyMZciKgQCLHgDQt3hKy7TQ24BRtDjKt3hKtjWXHszSt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKv4DQt3hKt3hKt3hYqPkKt3hKt3hKtLySt3hKlsBSt3hKtXmKt3hKt3hKt.WPA4hK1kDQt3hYyA0Pt3hKt3hKt3RNC4hKtLySt3hKlshKt3hKtXmKt3hKtLjKt3hKt3hKtYDQt3hKsAkKt3RLB0jKt3hKt3hKtLySt3hKlshKt3hK4LjKt3hKt3hKt3hKL4hKt3hYt3hKt3hKt3BbAEjKtf0Rp4hKt3hKt3hKt3hKt3hKt3hKt3hKtLjKt3hK5wTdLsxT1YUd17DQZ8Fc4vjKt3hK14hKt3hKt3hKvETPt3hcIQjKtX1bPMjKt3hKt3hKtjyPt3hKy7jKt3hYq3hKt3hK14hKt3hKC4hKt3hKt3haFQjKt3RaP4hKtDiPM4hKt3hKt3hKy7jKt3hYq3hKt3RNC4hKt3hKC4hKt3BSt3hKt3hKtXlVP4hKtHlPA4hKXsjdt3hKt3hKt3hYq3hKt3RNC4hKtLySt3hKt3hKt3hK4LjKt3xLOYjKt3hKt3hKtjSZrkEam8jKt3hKq3hKt3RNSkGS4QySH4hKt3hKt3hKCQjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3BSt3hKt3hKtXlVP4hKtHlPA4hKXsjdt3hKt3hKt3hYq3hKt3RNC4hKtLySt3hKt3BSt3hKtXmKt3hKt3hKt.WPA4hK1kDQt3hYyA0Pt3hKt3hKt3RNC4hKtLySt3hKlshKt3hKtXmKt3hKtLjKt3hKt3hKtYDQt3hKsAkKt3RLB0jKt3hKt3hKtLySt3hKlshKt3hK4LjKt3hKtLjKt3hKL4hKt3hKt3hYZAkKt3hXBEjKtf0R54hKt3hKt3hKlshKt3hK4LjKt3xLO4hKt3hKD4hKt3BTt3hKt3hKt3hXB0jKt3hKP4hKt3hKt3hKt3BQt3hKt3hKt3hKt3hKt3hKpYCRzYSdt3hKt3hPt3hKt3hKtPURD4hKtDGTB4hKt3hKt3hK4LjKt3xLO4hKt3hKD4hKt3hKt3hKt3RPt3hKtvTdLk2MokEaYUySA4hKt3hKt3hKt.kKt3hKtjGS4wzJXwVVrkyTt3hKt3hKt3hKt3hKtX2RD4hKt3hKN4hKt3hKt3hK2LUdLkmXO0TdLMUNt3hKtbyPA4hKt3hPt3hKtXlKt3hK1EjKt3hKA4hKt3BQt3hKt.kKt3hKtDjKt3hKD4hKt3hct3hKt3RPt3hKtPjKt3hKt3hKt3hKN4hKt3hKA4hKt3hKt3hKt3hKtXlKA4hKt3BQt3hKt3hKt3hYq3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKC4hKt3hKt3hKt3hKt3hKt3hKt3hKy3hKt3hKD4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKL4hKt3hKt3hKt3hKt3hKt3hKt3hKlMjKt3hKP4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKP4hKt3hKA4hKt3hKt3hK4LjKt3BU14hKt3hKH4hKt3hct3hKt3RPt3hKtPkKt3hKtDjKt3hKA4hKt3BSt3hKtXFaYw1aOoEaYYzJNkGS4kyPt3hKt3hKt3hKt3hKt3hKPEjKt3hKt3hKt3hKt3hKKwjKt3hb14hKtXmPC4hKtrjXA4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt.UPt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKP4hKt3hKt3hKt3BTt3hKt.kKt3hKtLjKt3hKXwVVrgSZrkEa2UWdLkmbq3hKt3hKt3hKt3hKt3hKt3BUt3hKt3hKt3hb14hKt3hKt3hKtrDSt3hKxYmKt3hcBckKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKT4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BQt3hKt3hKt3hKtPjKt3hKt3hKt3hct3hKt3xSJIFNqnWZBcEN1bTQzEySt3hKyITPt3hKt3hKt3hKtTjKt3hKt3hKtTDSt3hKTYmKt3hXBMjKtXWRL4hKtzlcE4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3RQt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtDjKt3hKt3hKt3hKA4hKt3hKt3hKtvjKt3hK1wTdLkWchgia1kyL0D0Y3LjKt3hKt3hKt3hKt3hKt3BTA4hKt3hKt3BTAMjKt3RQL4hKtzlct3hKhIzPt3hcIIVPt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKPEjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BTt3hKt3hKt3hKt.kKt3hKt3hKt3hKC4hKt3hYwcTQqL0SJIFLOQGYTMyJt3hKt3hKt3hKt3hKt3hKtPkKt3hKt3hKtPkct3hKPEzPt3hcIwjKt3Ra14hKtHlPW4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3BUt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtPjKt3hKt3hKt3hKt3hKt3hKt3hKt.kKt3hKtLjKt3hKtkEaYcSZrkEa2UWdLkmbq3hKt.kQD4hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hYRUUSTEETIckVwTjQisVTTgkdEYjKAQjYPQSPWgUdMcjKAQjct3hdA4hKt3hKt3hKtnTUv.UQAslXuk0UXoWUFE0YQcEV77RRC8Vav8lak4Fc9vyKVMEUy.Ea0cVZtMEcgQWY9.."
									}
,
									"fileref" : 									{
										"name" : "Podolski 1.2.2",
										"filename" : "Podolski 1.2.2.maxsnap",
										"filepath" : "~/Documents/Max 8/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "61b9224e029560e72dba9e29859cbbb5"
									}

								}
 ]
						}

					}
,
					"text" : "vst~",
					"varname" : "vst~",
					"viewvisibility" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 31.833333194255829, 98.666670262813568, 45.0, 22.0 ],
					"text" : "r #0_in"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 99.833333194255829, 172.666670262813568, 29.5, 22.0 ],
					"text" : "init"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 371.700000166893005, 763.666668713092804, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 371.700000166893005, 792.466669142246246, 59.0, 22.0 ],
					"text" : "tempo $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 228.900002777576447, 763.666668713092804, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 228.900002777576447, 791.466669142246246, 63.0, 22.0 ],
					"text" : "metro 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 171.600000262260437, 781.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 313.700002789497375, 791.466669142246246, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.100005209445953, 857.666670262813568, 93.599994957447052, 22.0 ],
					"text" : "0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 288.300003826618195, 857.666670262813568, 34.79999977350235, 22.0 ],
					"text" : "118."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 206.100002586841583, 857.666670262813568, 73.800000667572021, 22.0 ],
					"text" : "0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 171.600000262260437, 857.666670262813568, 31.199999809265137, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 132.833333790302277, 857.666670262813568, 31.199999809265137, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 9,
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"patching_rect" : [ 229.700002789497375, 824.466669619083405, 103.0, 22.0 ],
					"text" : "transport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 214.0, 182.666670262813568, 61.0, 22.0 ],
					"text" : "s #0_s4m"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "s4m.repl.maxpat",
					"numinlets" : 0,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 214.0, 11.666670262813568, 489.700002789497375, 159.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.333333194255829, 172.666670262813568, 34.0, 22.0 ],
					"text" : "scan"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 140.0, 68.333336651325226, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 72.0, 37.666670322418213, 97.0, 22.0 ],
					"text" : "udpreceive 7777"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 103.833333194255829, 344.0, 99.0, 22.0 ],
					"text" : "print s4m-output:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 9.833333194255829, 37.666670322418213, 57.0, 22.0 ],
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 134.5, 172.666670262813568, 35.0, 22.0 ],
					"text" : "reset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.833333194255829, 68.333336651325226, 111.0, 22.0 ],
					"text" : "prepend eval-string"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 9.833333194255829, 11.666670262813568, 59.0, 22.0 ],
					"text" : "r #0_s4m"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.833333194255829, 305.333340525627136, 99.0, 22.0 ],
					"saved_object_attributes" : 					{
						"ins" : 1,
						"log-null" : 0,
						"outs" : 1,
						"thread" : 104
					}
,
					"text" : "s4m players.scm"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"source" : [ "obj-10", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 1 ],
					"source" : [ "obj-10", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"source" : [ "obj-10", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"order" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"order" : 1,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 1 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"midpoints" : [ 228.200000166893005, 824.666670262813568 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 1 ],
					"source" : [ "obj-24", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"source" : [ "obj-27", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"midpoints" : [ 47.333333194255829, 684.0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-31", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 2 ],
					"source" : [ "obj-39", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 1 ],
					"source" : [ "obj-39", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 1 ],
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 71.0, 44.0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"midpoints" : [ 48.5, 821.0, 323.200002789497375, 821.0 ],
					"source" : [ "obj-44", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"midpoints" : [ 37.0, 822.0, 145.0, 822.0, 145.0, 749.0, 181.100000262260437, 749.0 ],
					"source" : [ "obj-44", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ 25.5, 818.0, 25.5, 818.0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"midpoints" : [ 105.200005829334259, 810.0, 323.200002789497375, 810.0 ],
					"source" : [ "obj-48", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"midpoints" : [ 93.700005829334259, 818.0, 144.0, 818.0, 144.0, 776.0, 181.100000262260437, 776.0 ],
					"source" : [ "obj-48", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"midpoints" : [ 82.200005829334259, 815.0, 25.5, 815.0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 1 ],
					"order" : 1,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 1 ],
					"order" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-24" : [ "vst~", "vst~", 0 ],
			"obj-27" : [ "live.gain~", "live.gain~", 0 ],
			"parameterbanks" : 			{

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "s4m.repl.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/Scheme-For-Max/patchers",
				"patcherrelativepath" : "../../../Max 8/Packages/Scheme-For-Max/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "Podolski 1.2.2.maxsnap",
				"bootpath" : "~/Documents/Max 8/Snapshots",
				"patcherrelativepath" : "../../../Max 8/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
, 			{
				"name" : "s4m.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
