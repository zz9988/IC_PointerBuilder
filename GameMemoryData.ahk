class GameMemoryData
{
    is64 := True
    IdleGameManager := new OffsetData
    GameSettings := new OffsetData
    EngineSettings := new OffsetData
    DialogManager := new OffsetData
    CrusadersGameDataSet := new OffsetData
}

class OffsetData
{
    moduleAddress := ""
    moduleOffset := ""
    staticOffset := ""
}